Rails.application.routes.draw do

  get 'question1/answer', to: 'questions#question1'
  get 'question2/answer', to: 'questions#question2'
  get 'question3/answer', to: 'questions#question3'
  get 'question4/answer', to: 'questions#question4'
  get 'question5/answer', to: 'questions#question5'

  namespace :api do
    resources :event_logs, only: [:index, :create]
  end
end
