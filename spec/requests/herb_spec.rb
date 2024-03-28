require 'rails_helper'

RSpec.describe 'Herbs', type: :request do
  describe 'GET #index' do
  it 'returns http success' do
    get herbs_path
    expect(response).to have_http_status(:success)
  end
end

describe 'GET #show' do
  it 'returns http success' do
    herb = Herb.create(name: 'Test Herb', watered: 'yes')
    get herb_path(herb)
    expect(response).to have_http_status(:success)
  end
end

describe 'GET #new' do
  it 'returns http success' do
    get herb_new_path
    expect(response).to have_http_status(:success)
  end
end

describe 'POST #create' do
  it 'creates a new herb' do
    post herbs_path, params: { 
      herb: { name: 'Test Herb for post request', watered: 'yes' } 
    }
    herb = Herb.where(name: 'Test Herb for post request').first
    expect(herb.valid?).to eq(true)
    expect(response).to redirect_to(herbs_path)
  end
end

describe 'GET #edit' do
  it 'returns http success' do
    herb = Herb.create(name: 'Test Herb', watered: 'yes')
    get edit_herb_path(herb)
    expect(response).to have_http_status(:success)
  end
end

describe 'PATCH #update' do
  it 'updates the herb' do
    herb = Herb.create(name: 'Test Herb', watered: 'yes')
    patch herb_path(herb), params: { 
      herb: { name: 'Test Herb for patch request', watered: 'no' } 
    }
    herb = Herb.where(name: 'Test Herb for patch request').first
    expect(herb.name).to eq('Test Herb for patch request')
    expect(herb.watered).to eq('no')
    expect(response).to redirect_to(herb_path(herb))
  end
end

describe 'DELETE #destroy' do
  it 'destroys the herb' do
    herb = Herb.create(name: 'Test Herb for delete request', watered: 'yes')
    delete herb_path(herb)
    herb = Herb.where(name: 'Test Herb for delete request').first
    expect(herb).to eq(nil)
    expect(response).to redirect_to(herbs_path)
  end
end
end
