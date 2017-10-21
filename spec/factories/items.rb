FactoryGirl.define do
  factory :item do
    num "194764"
    description "Some test item"
    size "100#"
    pack "10"
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
    trait :child_item_1 do
      num "394764"
      pack "1"
      price "5"
    end
    trait :child_item_2 do
      num "30194764"
      pack "1"
      price "5"
    end
    trait :fractional_weight_item do
      size "5/2.2#"
    end
    trait :apostrophe_weight do
      size "5'"
    end
    trait :range_weight do
      size "3-4#"
    end
  end

  initialize_with { Item.new(attributes) }

end