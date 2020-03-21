def shared_testing_pods
  pod 'Segment-Adobe-Analytics', :path => './'

  pod 'Specta'
  pod 'Expecta'
  pod 'OCMockito'
end

target 'Segment-Adobe-AnalyticsTests' do
  platform :ios, '8.0'
  # use_frameworks!
  shared_testing_pods
end

target 'Segment_Adobe_AnalyticsTestsTVOS' do
  platform :tvos, '9.0'
  # use_frameworks!
  shared_testing_pods
end
