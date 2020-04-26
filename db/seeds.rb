require "csv"

User.destroy_all
Post.destroy_all
Comment.destroy_all
Rating.destroy_all

# Import Users
CSV.foreach(Rails.root.join('db/csv/users.csv'), headers: true) do |row|
  
    User.create({
        id: row[0],
        email: row[1],
        name: row[2],
        github_username: row[3], 
        registered_at: row[4]
    })
    puts User
end
