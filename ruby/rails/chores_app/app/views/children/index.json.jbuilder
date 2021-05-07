# frozen_string_literal: true

json.array! @children, partial: 'children/child', as: :child
