require "rails_helper"

RSpec.describe Task, type: :model do
  describe "Task validate" do
    it "must have title " do
      task = Task.new
      expect(task).to_not be_valid
    end
    it "must have content" do
      task = Task.new
      expect(task).to_not be_valid
    end
  end
end
# 開始設定資料驗證
# 請思考需要在哪個欄位上加入哪種驗證比較好
# 與之配合的 DB 限制，請寫成 migration
# 以 rails generate 指令產生 migration file
# 在頁面上加入驗證的錯誤訊息
# 撰寫對應的 model 測試