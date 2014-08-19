from rest_framework import serializers
from models import Task, Tag
# from django.contrib.auth.models import User


class TaskSerializer(serializers.HyperlinkedModelSerializer): 
    owner = serializers.Field(source='owner.username')
    # tags = serializers.HyperlinkedRelatedField(view_name='tag-detail',many=True, lookup_field='name'

    class Meta:
        model = Task
        fields = ('name',)
        fields = ('url', 'owner', 'name', 'availability_type',
                  'pomodoro_all', 'pomodoro_completed', 'priority')
        read_only_fields = ('created',)


class TagSerializer(serializers.HyperlinkedModelSerializer):
    # owner = serializers.Field(source='owner.username')
    tasks = serializers.HyperlinkedRelatedField(many=True, view_name='task-detail')

    class Meta:
        model = Tag
        fields = ('url','name',)
        lookup_field = 'name'
