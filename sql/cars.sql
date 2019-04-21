select make.name as znacka
,model.model as model
,karoserie.value as karoserie
,barva.value as barva
,fuel.value as palivo
,transmission.value as prevodovka
,car.engine_power||'kW' as vykon
from data_service.car car
,data_service.car_model model
,data_service.car_make make
,data_service.codebook_item_ml_attrs barva
,data_service.codebook_item_ml_attrs karoserie
,data_service.codebook_item_ml_attrs fuel
,data_service.codebook_item_ml_attrs transmission
where car.car_model_id = model.id
 and model.make_id = make.id
 and barva.translation_key = car.color_code
 and barva.lang_code='cs'
 and karoserie.translation_key = car.body_type_code
 and karoserie.lang_code='cs'
 and fuel.translation_key = car.fuel_type_code
 and fuel.lang_code='cs'
 and transmission.translation_key = car.transmission_code
 and transmission.lang_code='cs'
 ;
