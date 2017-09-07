# See https://github.com/fotinakis/swagger-blocks#docs-controller

module V1

  class DocsController < ActionController::Base

    include V1::Concerns::Docs::DocsController

  end

end