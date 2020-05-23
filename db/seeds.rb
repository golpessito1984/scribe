##### CATEGORIES AND SUBCATEGORIES #####
category = FactoryBot.create(:category,
                             title: 'Programming',
                             order: 1)

sub_category = FactoryBot.create(:category,
                                 title: 'Ruby',
                                 order: 1)

sub_category2 = FactoryBot.create(:category,
                                  title: 'PHP',
                                  order: 2)

category.children << sub_category
category.children << sub_category2
