-- The views defined below provide a wrapper around
-- the orginal structure of SamManSys and allow for
-- the API to be used without occuring schema changes
-- with the database structure


DROP VIEW IF EXISTS `questionnaires_forms`;
DROP VIEW IF EXISTS `questionnaires_questions`;
DROP VIEW IF EXISTS `questionnaires_responses`;
DROP VIEW IF EXISTS `questionnaires_templates`;
DROP VIEW IF EXISTS `sample_collection_templates`;
DROP VIEW IF EXISTS `sample_collections`;
DROP VIEW IF EXISTS `sample_extra_identifiers`;
DROP VIEW IF EXISTS `sample_hazard_types`;
DROP VIEW IF EXISTS `sample_histories`;
DROP VIEW IF EXISTS `sample_list_samples`;
DROP VIEW IF EXISTS `sample_lists`;
DROP VIEW IF EXISTS `sample_templates`;
DROP VIEW IF EXISTS `samples`;
DROP VIEW IF EXISTS `shipment_samples`;
DROP VIEW IF EXISTS `stores_containers`;
DROP VIEW IF EXISTS `stores_positions`;
DROP VIEW IF EXISTS `stores_templates`;

SET @saved_cs_client          = @@character_set_client;
SET @saved_cs_results         = @@character_set_results;
SET @saved_col_connection     = @@collation_connection;
SET character_set_client      = utf8mb4;
SET character_set_results    = utf8mb4;
SET collation_connection      = utf8mb4_general_ci;
CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `questionnaires_forms` 
  AS 
    SELECT `completed_consent_questionnaires`.`id` AS `id`,`completed_consent_questionnaires`.`signed_date` AS `signed_date`,`completed_consent_questionnaires`.`witness_name` AS `witness_name`,`completed_consent_questionnaires`.`registration_to_cp_id` AS `registration_to_cp_id`,`completed_consent_questionnaires`.`scanned_uri` AS `scanned_uri`,`completed_consent_questionnaires`.`created_at` AS `created_at`,`completed_consent_questionnaires`.`updated_at` AS `updated_at`,`completed_consent_questionnaires`.`qc_performed` AS `qc_performed`,`completed_consent_questionnaires`.`template_name` AS `template_name` 
    FROM `completed_consent_questionnaires`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `questionnaires_questions` AS select `consent_questionnaire_questions`.`id` AS `id`,`consent_questionnaire_questions`.`consent_questionnaire_template_id` AS `questionnaires_template_id`,`consent_questionnaire_questions`.`position` AS `position`,`consent_questionnaire_questions`.`question` AS `question`,`consent_questionnaire_questions`.`status` AS `status`,`consent_questionnaire_questions`.`created_at` AS `created_at`,`consent_questionnaire_questions`.`updated_at` AS `updated_at` from `consent_questionnaire_questions`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `questionnaires_responses` AS select `consent_questionnaire_responses`.`id` AS `id`,`consent_questionnaire_responses`.`completed_consent_questionnaire_id` AS `questionnaires_form_id`,`consent_questionnaire_responses`.`answer` AS `answer`,`consent_questionnaire_responses`.`consent_questionnaire_question_id` AS `questionnaires_question_id`,`consent_questionnaire_responses`.`created_at` AS `created_at`,`consent_questionnaire_responses`.`updated_at` AS `updated_at` from `consent_questionnaire_responses`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER  
  VIEW `questionnaires_templates` AS select `consent_questionnaire_templates`.`id` AS `id`,`consent_questionnaire_templates`.`name` AS `name`,`consent_questionnaire_templates`.`created_at` AS `created_at`,`consent_questionnaire_templates`.`updated_at` AS `updated_at` from `consent_questionnaire_templates`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `sample_collection_templates` AS select `specimen_collection_templates`.`id` AS `id`,`specimen_collection_templates`.`collection_protocol_id` AS `collection_protocol_id`,`specimen_collection_templates`.`status` AS `status`,`specimen_collection_templates`.`name` AS `name`,`specimen_collection_templates`.`created_at` AS `created_at`,`specimen_collection_templates`.`updated_at` AS `updated_at`,`specimen_collection_templates`.`timepoint_type` AS `timepoint_type` from `specimen_collection_templates`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `sample_collections` AS select `specimen_collections`.`id` AS `id`,`specimen_collections`.`location_id` AS `location_id`,`specimen_collections`.`registration_to_cp_id` AS `registration_to_cp_id`,`specimen_collections`.`study_point_name` AS `study_point_name`,`specimen_collections`.`collection_date` AS `collection_date`,`specimen_collections`.`status` AS `status`,`specimen_collections`.`diagnosis` AS `diagnosis`,`specimen_collections`.`pathology_number` AS `pathology_number`,`specimen_collections`.`clinical_status` AS `clinical_status`,`specimen_collections`.`comments` AS `comments`,`specimen_collections`.`created_at` AS `created_at`,`specimen_collections`.`updated_at` AS `updated_at`,`specimen_collections`.`collection_status` AS `collection_status`,`specimen_collections`.`not_collected_reason` AS `not_collected_reason` from `specimen_collections`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `sample_extra_identifiers` AS select `extra_specimen_identifiers`.`id` AS `id`,`extra_specimen_identifiers`.`specimen_id` AS `sample_id`,`extra_specimen_identifiers`.`name` AS `name`,`extra_specimen_identifiers`.`value` AS `value`,`extra_specimen_identifiers`.`created_at` AS `created_at`,`extra_specimen_identifiers`.`updated_at` AS `updated_at` from `extra_specimen_identifiers`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `sample_hazard_types` AS select `hazard_types_specimens`.`hazard_type_id` AS `hazard_type_id`,`hazard_types_specimens`.`specimen_id` AS `sample_id` from `hazard_types_specimens`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `sample_histories` AS select `specimen_histories`.`id` AS `id`,`specimen_histories`.`specimen_id` AS `sample_id`,`specimen_histories`.`happened_at` AS `happened_at`,`specimen_histories`.`user_id` AS `user_id`,`specimen_histories`.`comments` AS `comments`,`specimen_histories`.`created_at` AS `created_at`,`specimen_histories`.`updated_at` AS `updated_at`,`specimen_histories`.`specimen_event` AS `sample_event` from `specimen_histories`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `sample_list_samples` AS select `specimen_list_specimens`.`id` AS `id`,`specimen_list_specimens`.`specimen_list_id` AS `sample_list_id`,`specimen_list_specimens`.`specimen_id` AS `sample_id`,`specimen_list_specimens`.`created_at` AS `created_at`,`specimen_list_specimens`.`updated_at` AS `updated_at` from `specimen_list_specimens`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `sample_lists` AS select `specimen_lists`.`id` AS `id`,`specimen_lists`.`name` AS `name`,`specimen_lists`.`user_id` AS `user_id`,`specimen_lists`.`created_at` AS `created_at`,`specimen_lists`.`updated_at` AS `updated_at` from `specimen_lists`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `sample_templates` AS select `specimen_templates`.`id` AS `id`,`specimen_templates`.`label_format` AS `label_format`,`specimen_templates`.`parent_specimen_template_id` AS `parent_sample_template_id`,`specimen_templates`.`relationship_to_parent` AS `relationship_to_parent`,`specimen_templates`.`initial_quantity` AS `initial_quantity`,`specimen_templates`.`status` AS `status`,`specimen_templates`.`specimen_collection_template_id` AS `sample_collection_template_id`,`specimen_templates`.`created_at` AS `created_at`,`specimen_templates`.`updated_at` AS `updated_at`,`specimen_templates`.`specimen_type` AS `sample_type`,`specimen_templates`.`specimen_class` AS `sample_class`,`specimen_templates`.`pathology_status` AS `pathology_status`,`specimen_templates`.`site` AS `site`,`specimen_templates`.`side` AS `side`,`specimen_templates`.`availability` AS `availability` from `specimen_templates`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `samples` AS select `specimens`.`id` AS `id`,`specimens`.`label` AS `label`,`specimens`.`barcode` AS `barcode`,`specimens`.`specimen_collection_id` AS `sample_collection_id`,`specimens`.`parent_id` AS `parent_id`,`specimens`.`relationship_to_parent` AS `relationship_to_parent`,`specimens`.`initial_quantity` AS `initial_quantity`,`specimens`.`available_quantity` AS `available_quantity`,`specimens`.`comments` AS `comments`,`specimens`.`status` AS `status`,`specimens`.`created_at` AS `created_at`,`specimens`.`updated_at` AS `updated_at`,`specimens`.`born_on` AS `born_on`,`specimens`.`specimen_type` AS `sample_type`,`specimens`.`specimen_class` AS `sample_class`,`specimens`.`pathology_status` AS `pathology_status`,`specimens`.`site` AS `site`,`specimens`.`side` AS `side`,`specimens`.`availability` AS `availability` from `specimens`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `shipment_samples` AS select `shipment_specimens`.`id` AS `id`,`shipment_specimens`.`shipment_id` AS `shipment_id`,`shipment_specimens`.`specimen_id` AS `sample_id`,`shipment_specimens`.`consent_checked` AS `consent_checked`,`shipment_specimens`.`created_at` AS `created_at`,`shipment_specimens`.`updated_at` AS `updated_at` from `shipment_specimens`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `stores_containers` AS select `storage_containers`.`id` AS `id`,`storage_containers`.`storage_container_template_id` AS `storage_container_template_id`,`storage_containers`.`name` AS `name`,`storage_containers`.`collection_protocol_id` AS `collection_protocol_id`,`storage_containers`.`created_at` AS `created_at`,`storage_containers`.`updated_at` AS `updated_at`,`storage_containers`.`size_x` AS `size_x`,`storage_containers`.`size_y` AS `size_y`,`storage_containers`.`barcode` AS `barcode`,`storage_containers`.`parent` AS `parent`,`storage_containers`.`ancestors` AS `ancestors` from `storage_containers`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `stores_positions` AS select `storage_container_positions`.`id` AS `id`,`storage_container_positions`.`storage_container_id` AS `storage_container_id`,`storage_container_positions`.`position_x` AS `position_x`,`storage_container_positions`.`position_y` AS `position_y`,`storage_container_positions`.`content_type` AS `content_type`,`storage_container_positions`.`content_id` AS `content_id`,`storage_container_positions`.`created_at` AS `created_at`,`storage_container_positions`.`updated_at` AS `updated_at`,`storage_container_positions`.`content_name` AS `content_name` from `storage_container_positions`;

CREATE 
  ALGORITHM=MERGE
  DEFINER=`root`@`%` 
  SQL SECURITY INVOKER
  VIEW `stores_templates` AS select `storage_container_templates`.`id` AS `id`,`storage_container_templates`.`name` AS `name`,`storage_container_templates`.`label_x` AS `label_x`,`storage_container_templates`.`label_y` AS `label_y`,`storage_container_templates`.`size_x` AS `size_x`,`storage_container_templates`.`size_y` AS `size_y`,`storage_container_templates`.`created_at` AS `created_at`,`storage_container_templates`.`updated_at` AS `updated_at` from `storage_container_templates`;

SET character_set_client      = @saved_cs_client;
SET character_set_results     = @saved_cs_results;
SET collation_connection      = @saved_col_connection;



