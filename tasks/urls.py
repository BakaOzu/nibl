from django.conf.urls import patterns, url, include
# from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework.routers import DefaultRouter
import views


router = DefaultRouter()
router.register(r'tasks', views.TaskViewSet)

 
urlpatterns = patterns('',
    url(r'^$', views.home, name='home'),
    url(r'^get_last/$', views.TaskGetLast.as_view(), name='get-last'),    
    url(r'^tags/$', views.TagList.as_view(), name='tag-list'),
    url(r'tags/(?P<name>[a-zA-Z0-9]+)/$', views.TagDetail.as_view(), name='tag-detail'),  
    url(r'^', include(router.urls)),
)