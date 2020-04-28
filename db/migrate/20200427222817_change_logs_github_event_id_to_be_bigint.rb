class ChangeLogsGithubEventIdToBeBigint < ActiveRecord::Migration[6.0]
    def change
        change_column :logs, :github_event_id, :bigint
    end
end
