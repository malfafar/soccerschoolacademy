class Document < ActiveRecord::Base
  has_attached_file :file
      # :storage => :s3,
      # :s3_credentials => {
      #   :bucket => ENV["S3_BUCKET_NAME"],
      #   :access_key_id => ENV["AWS_ACCESS_KEY_ID"],
      #   :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
      # },
      # :s3_permissions => :private,
      # :s3_protocol => 'https',
      # :url => ':s3_domain_url',
      # :path => "/:class/documents/:id/:basename.:style.:extension",
      # :s3_host_name => 's3.eu-central-1.amazonaws.com'
  validates_attachment_content_type :file, :content_type => [
              'application/pdf',
              'application/msword','applicationvnd.ms-word','application/vnd.openxmlformats-officedocument.wordprocessingml.document',
              'application/msexcel','application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
              'application/mspowerpoint','application/vnd.ms-powerpoint','application/vnd.openxmlformats-officedocument.presentationml.presentation',
              'text/plain'
              ]

  def self.search(search)
    where('file_file_name ILIKE :search', search: "%#{search}%")
  end
end
