module GoogleSheetReader
  class Error < StandardError;
    def backtrace
      return cause.backtrace if cause
      super
    end

    def message
      return cause.message if cause
      super
    end
  end

  class BadSheetId < Error; end

  class MissingEnvVars < Error
    def message
      "Missing environment variables for the service account.\n" \
      "Please provide #{REQUIRED_ENV_VARS.join(', ')}.\n" \
      "See https://github.com/clearbit/google_sheet_reader for more info.\n"
    end
  end
end
