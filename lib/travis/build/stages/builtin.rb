require 'travis/build/stages/base'

module Travis
  module Build
    class Stages
      class Builtin < Base
        def run
          run_addon_stage :"before_#{name}"

          with_stage(name) do
            run_addon_stage :script if script? # TODO for coverity_scan
            if script.respond_to?(name, true)
              script.send(name)
              result if script?
            end
          end

          run_addon_stage :"after_#{name}"
        end
      end
    end
  end
end
