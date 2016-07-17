class ApplicationPolicy

  def index?
    true
  end

  def show?
     user_exists?
  end

  def create?
    user_exists?
  end

  def new?
    create?
  end

  def update?
    user_exists?
  end

  def edit?
    update?
  end

  def destroy?
    record_owned_by_user? || user_is?('admin')
  end

  def scope
   record.class
  end

  def record_exists?
    scope.where(:id => record.id).exists?
  end

  def record_owned_by_user?
    return false if record.user.nil?
    return false unless user_exists?
    record.user == user
  end

  def user_exists?
    user.present?
  end

  def user_is?(*roles)
    user_exists? && roles.any? { |role| user.send(:"#{role}?") }
  end
end
