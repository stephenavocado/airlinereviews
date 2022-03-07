class EducationModuleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :module_id, :status
end
