require "rails_helper"

RSpec.feature "Task CRUD", :type => :feature do
  scenario "User creates a new task" do
    visit "/tasks/new"

    fill_in "task_title", :with => "title"
    fill_in "task_content", :with => "content"
    first('input[type="submit"]').click

    expect(page).to have_text(I18n.t('tasks.create.notice'))
  end
  scenario "User updates a task" do
    @task = FactoryBot.create(:task)
    visit "/tasks/#{@task.id}/edit"

    fill_in "task_title", :with => "update_title"
    fill_in "task_content", :with => "update_content"
    first('input[type="submit"]').click

    expect(page).to have_text(I18n.t('tasks.update.notice'))
  end
  describe 'sorting' do
    let(:asc_result) { Task.order(created_at: :asc).pluck(:title) }
    let(:desc_result) { Task.order(created_at: :desc).pluck(:title) }

    before do
      visit tasks_path
    end

    it 'by "created_at" ASC' do
      text_initial_load = all('tbody>tr>td:nth-child(1)').map(&:text)

      expect(text_initial_load).to eq(asc_result)
    end

    it 'by "created_at" DESC' do
      text_initial_load = all('tbody>tr>td:nth-child(1)').map(&:text)
      
      expect(text_initial_load).to eq(desc_result)
    end
  end
end