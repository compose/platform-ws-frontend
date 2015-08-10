module DeploymentsHelper

  DISPLAY_NAMES = {
    'elasticsearch' => 'Elasticsearch',
    'mongodb' => 'MongoDB',
    'rethink' => 'RethinkDB',
    'redis' => 'Redis',
    'postgresql' => 'PostgreSQL',
    'disque' => 'Disque',
    'influxdb' => 'InfluxDB',
    'cassandra' => 'Cassandra',
    'devnull' => '/dev/null'
  }
  
  def display_name(type)
    type = type.type if type.is_a?(Deployment)
    DISPLAY_NAMES[type] || "Deployment"
  end

  def current_deployment
    @current_deployment
  end
end
