# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Project'
        db.create_table(u'tasks_project', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal(u'tasks', ['Project'])

        # Adding model 'Tag'
        db.create_table(u'tasks_tag', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=20)),
        ))
        db.send_create_signal(u'tasks', ['Tag'])

        # Adding model 'Task'
        db.create_table(u'tasks_task', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('project', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tasks.Project'])),
            ('availability_type', self.gf('django.db.models.fields.CharField')(default='always', max_length=10)),
            ('type', self.gf('django.db.models.fields.CharField')(default='pomodoro', max_length=10)),
            ('pomodoro_all', self.gf('django.db.models.fields.IntegerField')(default=0)),
            ('pomodoro_completed', self.gf('django.db.models.fields.IntegerField')(default=0)),
        ))
        db.send_create_signal(u'tasks', ['Task'])

        # Adding M2M table for field tag on 'Task'
        m2m_table_name = db.shorten_name(u'tasks_task_tag')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('task', models.ForeignKey(orm[u'tasks.task'], null=False)),
            ('tag', models.ForeignKey(orm[u'tasks.tag'], null=False))
        ))
        db.create_unique(m2m_table_name, ['task_id', 'tag_id'])


    def backwards(self, orm):
        # Deleting model 'Project'
        db.delete_table(u'tasks_project')

        # Deleting model 'Tag'
        db.delete_table(u'tasks_tag')

        # Deleting model 'Task'
        db.delete_table(u'tasks_task')

        # Removing M2M table for field tag on 'Task'
        db.delete_table(db.shorten_name(u'tasks_task_tag'))


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