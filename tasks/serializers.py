from rest_framework import serializers
from models import Task, Tag
# from django.contrib.auth.models import User


class TaskSerializer(serializers.HyperlinkedModelSerializer): 
    owner = serializers.Field(source='owner.username')
    tags = serializers.RelatedField(many=True)

    class Meta:
        model = Task
        fields = ('name',)
        fields = ('url', 'owner', 'name', 'availability_type', 'tags',
                  'pomodoro_all', 'pomodoro_completed', 'priority')
        read_only_fields = ('created',)


class TagSerializer(serializers.Serializer):
    # owner = serializers.Field(source='owner.username')
    # tasks = serializers.HyperlinkedRelatedField(many=True, view_name='task-detail')
    name = serializers.CharField(max_length=20)