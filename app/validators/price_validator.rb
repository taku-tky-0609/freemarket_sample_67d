class PriceValidator < ActiveModel::Validator
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