# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding unique constraint on 'Task', fields ['created']
        db.create_unique(u'tasks_task', ['created'])


    def backwards(self, orm):
        # Removing unique constraint on 'Task', fields ['created']
        db.delete_unique(u'tasks_task', ['created'])


    models = {
        u'tasks.project': {
            'Meta': {'object_name': 'Project'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'tasks.tag': {
            'Meta': {'object_name': 'Tag'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'tasks.task': {
            'Meta': {'object_name': 'Task'},
            'availability_type': ('django.db.models.fields.CharField', [], {'default': "'always'", 'max_length': '10'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'unique': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'pomodoro_all': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'pomodoro_completed': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'project': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['tasks.Project']"}),
            'tag': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['tasks.Tag']", 'symmetrical': 'False'}),
            'type': ('django.db.models.fields.CharField', [], {'default': "'pomodoro'", 'max_length': '10'})
        }
    }

    complete_apps = ['tasks']