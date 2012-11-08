HamlHelpersInDecoratorUsedInMailerView::Application.routes.draw do
  get 'test/:action' => 'test'
  root :to => 'test#mail_with_haml_in_decorator'
end
