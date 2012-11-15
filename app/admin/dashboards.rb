ActiveAdmin::Dashboards.build do
  section "Recent Books" do
      table_for Book.order("created_at desc").limit(5) do
          column :title
          column :created_at
      end
      strong { link_to "View All Books", admin_books_path}
  end
end