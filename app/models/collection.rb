class Collection < ApplicationRecord
  validates :name, :url, presence: true

  has_many :projects

  def to_s
    name
  end

  def keywords
    projects.pluck(:keywords).flatten.group_by(&:itself).transform_values(&:count).sort_by{|k,v| v}.reverse
  end

  def committers
    projects.map(&:committers_names).flatten.group_by(&:itself).transform_values(&:count).sort_by{|k,v| v}.reverse
  end

  def committers_projects(name)
    projects.select{|p| p.committers_names.include?(name) }
  end

  def dependencies
    deps = projects.map(&:dependency_packages).flatten(1)
    deps.group_by(&:itself).transform_values(&:count).sort_by{|k,v| v}.reverse
  end

  def dependency_projects(dependency)
    projects.select{|p| p.dependency_packages.include?(dependency.split(':')) }
  end
end
