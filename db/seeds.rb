require "csv"
# Spinner gem that gives the user a visual display that the database is seeding
require "whirly"

Whirly.start spinner: "bars", color: true, status: "Destroying Seeds" do
    User.destroy_all
    Post.destroy_all
    Comment.destroy_all
    Rating.destroy_all 
end

Whirly.start spinner: "bars", color: true, status: "Seeding Users" do
    # Import Users
    CSV.foreach(Rails.root.join('db/csv/users.csv'), headers: true, liberal_parsing: true) do |row|
    
        User.create({
            id: row[0],
            email: row[1],
            name: row[2],
            github_username: row[3], 
            registered_at: row[4],
            created_at: row[5],
            updated_at: row[6]
        })

    end
end

Whirly.start spinner: "bars", color: true, status: "Seeding Posts" do
    # Import Posts
    CSV.foreach(Rails.root.join('db/csv/posts.csv'), headers: true, liberal_parsing: true) do |row|

        Post.create({
            id: row[0],
            title: row[1],
            body: row[2],
            user_id: row[3], 
            posted_at: row[4],
            created_at: row[5],
            updated_at: row[6]
        })
        
    end
end

Whirly.start spinner: "bars", color: true, status: "Seeding Comments" do
    # Import Comments
    CSV.foreach(Rails.root.join('db/csv/comments.csv'), headers: true, liberal_parsing: true) do |row|
    
        Comment.create({
            id: row[0],
            user_id: row[1],
            post_id: row[2],
            message: row[3],
            commented_at: row[4],
            created_at: row[5],
            updated_at: row[6]
        })
        
    end
end

Whirly.start spinner: "bars", color: true, status: "Seeding Ratings" do
    # Import Ratings
    CSV.foreach(Rails.root.join('db/csv/ratings.csv'), headers: true, liberal_parsing: true) do |row|
    
        Rating.create({
            id: row[0],
            user_id: row[1],
            rater_id: row[2],
            rating: row[3],
            rated_at: row[4],
            created_at: row[5],
            updated_at: row[6]
        })
        
    end
end