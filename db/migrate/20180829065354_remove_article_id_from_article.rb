class RemoveArticleIdFromArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :article_id, :integer
  end
end
