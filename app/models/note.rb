class Note < ApplicationRecord
  # include PgSearch
  # pg_search_scope :search_by_title_and_content,
  #   against: [ :title, :content],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
  searchkick

  def search_data
    {
      title: title,
      content: content
    }
  end

  belongs_to :user
  end
