require "rails_helper"

RSpec.feature "Task CRUD", :type => :feature do
  scenario "User creates a new task" do
    visit "/tasks/new"

    fill_in "task_title", :with => "title"
    fill_in "task_content", :with => "content"
    first('input[type="submit"]').click

    expect(page).to have_text("task create succefully")
  end
  scenario "User updates a task" do
    @task = FactoryBot.create(:task)
    visit "/tasks/#{@task.id}/edit"

    fill_in "task_title", :with => "update_title"
    fill_in "task_content", :with => "update_content"
    first('input[type="submit"]').click

    expect(page).to have_text("Success Edit")
  end
end