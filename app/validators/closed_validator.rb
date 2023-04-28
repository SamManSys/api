class ClosedValidator < ActiveModel::Validator
  def validate(record)
    if (record.status == "closed") && (record.changed_attributes.exclude? "status")
      record.errors.add :base, :invalid, message: "Specimen is closed.  Cannot be updated"
    end
  end
end
