# README

1- Products
  -- Containg Everything that can be ordered.
    -- Like Tomatos, Onion, Cheese, and Pizzas
  -- Products may also have extra items with they like extra 1 Tomato or 1 Cheese
    -- So, It may be good to create a self Reference and name it Toppings
2- ProductType
  -- Contains Information about the Type of Product like Pizza, or Toppings, and other Properties like the Size.
    -- Pizza Types can be Mexican, BBQ, PeriPeri etc.
3- Orders
  -- Will be a record that contains the reference of a particular Product, the number of units for that Product, and the Order Status
    -- ForExample: It can be:
      -- 1 x Mexican Pizza (Large)
        -- Custom Instuctions
          -- Add 2 Tomatoes
          -- Add 1 slice of Cheese
  -- Orders can also have SpecialCodes (Will take into consideration after calculating the Original Item Price, Then the Total can be calculated using the updated Item Prices.)

4- SpeacialCodes
  -- Will have two types of dicounts, Promotional and Discount
  -- Each would have unique number of string + number (6 digit long) Custom logic to create this can be added later on.



Orders has_many Products
Order has_many SpeacialCodes

Products has_one ProductType (Only the Pizza really needs a Type, So the relationship can be optional: true)
Product has_many Product(Renamed as toppings)


That seems all..


Product:
unique_id
name

When selfreference the Product would be Toppings, that would have
product_id

ProductType:
unique_id
type
size

Orders
uuid_id (for the Orders)
product_ids (Build associations when order info is saved.)
status

SpeacialCodes
type
name
unique_code
expiry_date


---


1- Since a Order will have Multiple Products
  -- And for each Product there needs to be some sub_form that would allow to add Toppings/ExtraItems
    -- The form would be nested
2- The form will be for a single Order.
  -- Each order can have multiple products.
    -- So, would have to use cacoon for it.
    -- Each form added will be for a single product.
    	-- But that form would have a nested form in it that would basically allow you to add items
    	  -- The form may not be there at first, by default. But may be added by clicking a button.
    	  -- That form would also use cacoon as, One can add multiple items to a single product.
        -- Adding cacoon twice may not be possible as I have not tried that before but will see.
3- There would also be a form for promotional codes, These can be multiple, As there can be more than one promotional codes. The same would apply for discount codes
5- At the Moment We would have a form structure like this:

form -> Order            # Form Level 1
  form -> Product-1      # Form Level 2
    form -> p1_item-1    # Form Level 3
    form -> p1_item-2
  form -> Product-2
    form -> p2_item-1
  form -> Product-3

  form -> PromotionalCode/DiscontCode-1
  form -> PromotionalCode/DiscontCode-2
end

order {
  order attributes
  + 
  Array -> products
  each Product {
    product attributes
    + 
    Array -> Toppings
    each Topping {
      topping Attributes
    }
  }
}

The Order Record would already be created in  the db before the proper order is created.
When the form would be submitted then:
- All the related objects associations would be built.
- Would have to look into that.
  -- I do know that cacoon has some methods that handle these complex nested associations, Well atleast for single level nesting. Will need to look into that.

-- Also after the records are saved some processing needs to be done too, Most Likely in a AfterSave Callback.
  -- Where we would have to calculate the price of each Item (Product + it's extra toppings).
    -- Then check if the promotional/discount codes apply to each item and then reduce that price.
    -- Then at the end calculate the total for that order
    -- Then see if any promotional/discount codes apply to the order price as a whole. And Reduce the total price once agin.
    -- Then At last save the Total price in the realted attribute of order table.
    -- mark the order as uncompleted too or mark it false, (Can set a default value for it in the db)
- After all that the order can be listed in it's own index page.