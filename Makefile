
docs/index.yaml: docs/packages/istio-config-0.1.0.tgz docs/packages/monitoring-0.1.0.tgz Makefile
	cd docs ; helm repo index . --url http://charts.bt5.home:8314
docs/packages/istio-config-0.1.0.tgz: istio-config/charts/kiali-server-1.83.0.tgz
	cd docs/packages ; helm package ../../istio-config

docs/packages/monitoring-0.1.0.tgz: monitoring/charts/kube-prometheus-stack-58.1.3.tgz \
	monitoring/charts/loki-6.2.0.tgz \
	monitoring/charts/promtail-6.15.5.tgz \
	monitoring/charts/opentelemetry-collector-0.87.2.tgz \
	monitoring/charts/tempo-1.7.2.tgz
	cd docs/packages ; helm package ../../monitoring

istio-config/charts/kiali-server-1.83.0.tgz: istio-config/Chart.yaml istio-config/values.yaml
	cd istio-config ; helm dependency build

monitoring/charts/kube-prometheus-stack-58.1.3.tgz: monitoring/Chart.yaml monitoring/values.yaml
	cd monitoring ; helm dependency build
