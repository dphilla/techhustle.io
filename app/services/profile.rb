class Profile
  attr_reader :name,
              :link

  def initialize(attrs)
    @name = attrs["displayName"]
    @link = attrs["url"]
  end

  def self.profile_collection #pass in possible argument for query -- see initialize in google service
    raw_profiles = GoogleService.new.parsed_json
    raw_profiles.map do |profile|
      Profile.new(profile)
    end
  end

end
