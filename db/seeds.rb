# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# table_names = %w(users articles entries)
# table_names.each do |table_name|
#     path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
#     if File.exist?(path)
#         puts "Creating #{table_name}..."
#         require path
#     end
# end
num = 0
5.times do |no|
  Message.create(message: "ほげほげ",
                 user_id: "1",
                 group_id: "1",
                 created_at: "2017-07-28 13:44:#{num+1}",
                 updated_at: "2017-07-28 13:44:#{num+1}"
                )
end

5.times do |no|
  Message.create(message: "hogehogehoge",
                 admin_id: "3",
                 group_id: "1",
                 created_at: "2017-07-28 13:45:#{num+1}",
                 updated_at: "2017-07-28 13:45:#{num+1}"
                )
end

  5.times do |no|
  Message.create(message: "ほげほげ",
                 user_id: "1",
                 group_id: "1",
                 created_at: "2017-07-28 13:46:#{num+1}",
                 updated_at: "2017-07-28 13:46:#{num+1}"
                )
end

