class PasswordManager2
    # The Password Manager 2 class creates a hash that stores passwords for different services and methods to access, add, remove,
    # and update the stored passwords.

    # The Initialize method sets up an instance variable, @password_storage, which stores the service and passwords as a hash
    def initialize
        @password_storage = {}
    end
      
    # The add method takes two arguments, service and password, and adds them to the @password_storage Hash, returning an error
    # if either of the arguments are already in the hash.
    def add(service, password)
        if @password_storage.has_key?(service)
            return 'ERROR: Service names must be unique'
        elsif @password_storage.values.include?(password)
            return 'ERROR: Passwords must be unique'
        else
            return @password_storage[service] = password
        end
    end
    
    # The remove method takes one argument, service, removing it and its associated password from the @password_storage hash
    def remove(service)
        return @password_storage.delete(service)
    end

    # The service method returns an array of all the services stored in the @password_storage hash
    def services
        return @password_storage.keys
    end

    # The sort_by method takes one argument, `service`, which determines how the keys are arranged,
    # if the argument is 'service' the array will be sorted alphabetically by the keys. If the argument is
    # 'added_on', the array will be sorted in reverse order of when the service was added.
    
    def sort_by(service)
        if service == 'service'
            return @password_storage.keys.sort
        elsif service == 'added_on'
            return @password_storage.keys.reverse { |service| @password_storage[service] }
        end
    end

    # The password_for method takes one argument, service, and returns the password associated with that service.
    def password_for(service)
        return @password_storage[service]
    end

    # The update method takes two arguments, service and new_password, and updates the password associated with the service
    # argument with the new_password argument, returning an error if the new_password is already in use.
    def update(service, new_password)
        if @password_storage.values.include?(new_password)
            return 'Password is already in use'
        else
            return @password_storage[service] = new_password
        end
    end
    
end