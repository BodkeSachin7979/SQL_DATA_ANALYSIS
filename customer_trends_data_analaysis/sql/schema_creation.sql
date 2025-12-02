CREATE TABLE public.customer_behaviour_analysis (
    customer_id               INT,
    age                       INT,
    gender                    TEXT,
    item_purchased            TEXT,
    category                  TEXT,
    purchase_amount           INT,
    location                  TEXT,
    size                      TEXT,
    color                     TEXT,
    season                    TEXT,
    review_rating             FLOAT,
    subscription_status       TEXT,
    shipping_type             TEXT,
    discount_applied          TEXT,
    previous_purchases        INT,
    payment_method            TEXT,
    frequency_of_purchases    TEXT,
    age_group                 TEXT,
    purchase_frequency_days   INT
);

ALTER TABLE customer_behaviour_analysis RENAME TO CUSTOMER;

select * 
from customer;
