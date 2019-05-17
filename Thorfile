require 'active_record'
require 'yaml'

class User < ActiveRecord::Base;end
class Entry < ActiveRecord::Base;end
class Comment < ActiveRecord::Base;end

class DB < Thor
  include Thor::Actions

  CONF = YAML.load_file(File.join(__dir__, 'database.yml'))

  desc "hello", "hello"
  def hello
    puts <<-EOL
      Hello
    EOL
  end

  desc "migrate", "migrate database"
  def migrate
    command = %q{bundle exec ridgepole -c database.yml --table-options 'ENGINE=InnoDB DEFAULT CHARSET=utf8' --apply}
    if %w(true 1).include?(ENV['DRY_RUN'])
      command << ' --dry-run'
    else
      command
    end
    run command
  end

  desc "seed", "create random records."
  def seed
    require 'bulk_insert'
    require 'faker'

    ActiveRecord::Base.establish_connection(CONF)

    Faker::Config.random = Random.new(42)

    count_users             = 1000
    count_entries_per_user  = 10
    count_comments_per_user = 5

    puts "User: start to insert"
    User.bulk_insert(ignore: true, set_size: 100) do |worker|
      count_users.times do
        worker.add(name: Faker::Name.name, email: Faker::Internet.unique.email, password: Faker::Internet.password)
      end
    end
    user_ids = User.all.pluck(:id)
    puts "User: end. total count: #{user_ids.count}"

    puts "Entry: start to insert"
    Entry.bulk_insert do |worker|
      user_ids.each do |user_id|
        count_entries_per_user.times do
          worker.add(user_id: user_id, title: Faker::Lorem.words.join("\n"), content: Faker::Lorem.sentences.join("\n"))
        end
      end
    end
    entry_ids = Entry.all.pluck(:id)
    puts "Entry: end. total count: #{entry_ids.count}"

    puts "Comment: start to insert"
    Comment.bulk_insert do |worker|
      entry_ids.each do |entry_id|
        count_comments_per_user.times do
          worker.add(entry_id: entry_id, content: Faker::Lorem.sentences.join("\n"))
        end
      end
    end
    comment_count = Comment.all.count
    puts "Comment: end. total count: #{comment_count}"

  end
end
