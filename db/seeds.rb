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
        registered_at: row[4],
        created_at: row[5],
        updated_at: row[6]
    })
    puts User
end

# Import Posts
CSV.foreach(Rails.root.join('db/csv/posts.csv'), headers: true) do |row|
  
    Post.create({
        id: row[0],
        title: row[1],
        body: row[2],
        user_id: row[3], 
        posted_at: row[4],
        created_at: row[5],
        updated_at: row[6]
    })
    puts Post
end
