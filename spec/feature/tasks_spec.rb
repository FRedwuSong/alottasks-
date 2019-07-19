require "rails_helper"

RSpec.feature "Task CRUD", :type => :feature do
  scenario "User creates a new task" do
    visit "/tasks/new"

    fill_in "task_title", :with => "title"
    fill_in "task_content", :with => "content"
    click_button "Create Task"

    expect(page).to have_text("task create succefully")
  end
end