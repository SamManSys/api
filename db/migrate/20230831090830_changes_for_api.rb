class ChangesForApi < ActiveRecord::Migration[6.1]
  def change
    # Containers
    rename_table 'storage_containers', 'stores_containers'
    rename_table 'storage_container_templates', 'stores_templates'
    rename_table 'storage_container_positions', 'stores_positions'

    rename_column 'shipment_containers', 'storage_container_id', 'stores_container_id'
    rename_column 'storage_container_collection_protocols', 'storage_container_id', 'stores_container_id'
    rename_column 'stores_positions', 'storage_container_id', 'stores_container_id'
    rename_column 'stores_containers', 'storage_container_template_id', 'stores_template_id'
    # Questionnaires
    rename_table 'completed_consent_questionnaires', 'questionnaires_forms'
    rename_table 'consent_questionnaire_questions', 'questionnaires_questions'
    rename_table 'consent_questionnaire_responses', 'questionnaires_responses'
    rename_table 'consent_questionnaire_templates', 'questionnaires_templates'
    
    rename_column 'questionnaires_responses', 'completed_consent_questionnaire_id', 'questionnaires_form_id'
    rename_column 'questionnaires_responses', 'consent_questionnaire_question_id', 'questionnaires_question_id'
    rename_column 'active_consent_questionnaire_templates', 'consent_questionnaire_template_id', 'questionnaires_template_id'
    rename_column 'questionnaires_questions', 'consent_questionnaire_template_id', 'questionnaires_template_id'

    # Samples
    rename_table 'specimens', 'samples'
    rename_table 'extra_specimen_identifiers', 'sample_extra_identifiers'
    rename_table 'specimen_histories', 'sample_histories'
    rename_table 'shipment_specimens', 'shipment_samples'
    rename_table 'hazard_types_specimens', 'sample_hazard_types'
    rename_table 'specimen_list_specimens', 'sample_list_samples'
    rename_table 'specimen_lists', 'sample_lists'
    rename_table 'specimen_templates', 'sample_templates'
    rename_table 'specimen_collection_templates', 'sample_collection_templates'
    rename_table 'specimen_collections', 'sample_collections'

    rename_column 'samples', 'specimen_class', 'sample_class'
    rename_column 'samples', 'specimen_type', 'sample_type'
    rename_column 'samples', 'specimen_collection_id', 'sample_collection_id'
    rename_column 'sample_templates', 'specimen_collection_template_id', 'sample_collection_template_id'
    rename_column 'sample_templates', 'specimen_class', 'sample_class'
    rename_column 'sample_templates', 'specimen_type', 'sample_type'
    rename_column 'sample_extra_identifiers', 'specimen_id', 'sample_id'
    rename_column 'hazards', 'specimen_id', 'sample_id'
    rename_column 'sample_hazard_types', 'specimen_id', 'sample_id'
    rename_column 'shipment_samples', 'specimen_id', 'sample_id'
    rename_column 'sample_list_samples', 'specimen_id', 'sample_id'
    rename_column 'sample_histories', 'specimen_id', 'sample_id'
    rename_column 'sample_histories', 'specimen_event', 'sample_event'
    rename_column 'sample_list_samples', 'specimen_list_id', 'sample_list_id'
    rename_column 'sample_templates', 'parent_specimen_template_id', 'parent_sample_template_id'
    
    # Remove unused
    remove_column 'patients', 'ethnic_group_id'
    drop_table 'user_research_group_roles'
    drop_table 'user_research_groups'
    drop_table 'storage_container_collection_protocols'
    drop_table 'storage_container_restrictions'
    drop_table 'storage_container_template_restrictions'
    drop_table 'research_group_securables'
    drop_table 'research_groups'
    drop_table 'group_references'
    drop_table 'ethnic_groups'
    drop_table 'template_restrictions'
  end
end
