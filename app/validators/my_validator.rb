class MyValidator < ActiveModel::Validator

  def validate(record)
    if record.category_id == 0 
      record.errors.add('category_id', 'は最後まで選択してください')
    elsif record.category_id == 1
      record.errors.add('category_id', 'は最後まで選択してください')
    end
  end

  def validate(record)
    if record.price == nil 
      record.errors.add('price', 'が入力されていません')
    elsif record.price < 50
      record.errors.add('price', 'は50円以上にしてください')
    elsif record.price > 9999999
      record.errors.add('price', 'は1000万円未満にしてください')
    end
  end
end