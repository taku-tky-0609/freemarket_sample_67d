class MyValidator < ActiveModel::Validator

  def validate(record)
    if record.category_id == 0
      record.errors.add('category_id', 'は最後まで選択してください')
    end
  end
end