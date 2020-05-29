Rails.application.routes.draw do
  namespace  'api' do 
    namespace 'v1' do
      resources :answers
      resources :questions
      get 'search_answers', to: 'answers#search'
    end
  end
end
