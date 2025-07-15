# frozen_string_literal: true

module DisneyScrapbook
  class Version
    def self.current
      @current ||= parse_changelog
    end

    def self.deployed_at
      @deployed_at ||= deployment_time
    end

    def self.deployed_at_eastern
      deployed_at.in_time_zone("America/New_York")
    end

    private

    def self.parse_changelog
      changelog_path = Rails.root.join("CHANGELOG.md")
      return "0.0.0" unless File.exist?(changelog_path)

      content = File.read(changelog_path)
      # Match version patterns like [1.1.1] or [1.1.1-alpha.1] or [1.1.1-beta.2]
      match = content.match(/## \[(\d+\.\d+\.\d+(?:-[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*)?)\]/)
      match ? match[1] : "0.0.0"
    rescue
      "0.0.0"
    end

    def self.deployment_time
      # Try to get deployment time from various sources in order of preference

      # 1. Check for DEPLOYED_AT environment variable (set during deployment)
      return Time.parse(ENV["DEPLOYED_AT"]) if ENV["DEPLOYED_AT"].present?

      # 2. Try to get git commit timestamp
      git_commit_time = get_git_commit_time
      return git_commit_time if git_commit_time

      # 3. Check modification time of key application files
      key_files = [
        Rails.root.join("Gemfile.lock"),
        Rails.root.join("config", "application.rb"),
        Rails.root.join("app", "controllers", "application_controller.rb")
      ]

      latest_file_time = key_files.map do |file|
        File.exist?(file) ? File.mtime(file) : nil
      end.compact.max

      return latest_file_time if latest_file_time

      # 4. Fall back to application boot time
      Rails.application.config.deployed_at || Time.current
    rescue
      Time.current
    end

    def self.get_git_commit_time
      return nil unless File.exist?(Rails.root.join(".git"))

      result = `git log -1 --format=%cI 2>/dev/null`.strip
      return nil if result.empty?

      Time.parse(result)
    rescue
      nil
    end
  end

  VERSION = Version.current.freeze
  DEPLOYED_AT = Version.deployed_at.freeze
end
