class SampleResource < SpecimenResource
  self.model = Specimen
  self.type = :samples

  primary_endpoint '/samples', [:index, :show, :create, :update, :destroy]
end
