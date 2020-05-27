class EstimatedDelivery < ActiveHash::Base
  self.data = [
    {id: 1, name: '送料込み（１〜２日で発送）'},
    {id: 2, name: '送料込み（２〜３日で発送）'},
    {id: 3, name: '送料込み（４〜７日で発送）'}
  ]
end