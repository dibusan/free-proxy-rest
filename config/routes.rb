Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'proxies' => 'proxies#index'
  post 'proxies' =>  'proxies#create'
  post 'proxies/batch' =>  'proxies#create_batch'
end
