FactoryGirl.define do
  factory :item do
    num "3194764"
    description "Some test item"
    size "100#"
    pack "1"
    price "50.00"
    cw "N"
    rw "N"
    brand "Some Brand"
    upc "3194764"
    vin "12"
    sym "$"
    vid "3456"
    area "d"
    box_weight "50.00"
    slot "0405"
  end

  initialize_with { Item.new(attributes) }

end