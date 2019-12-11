class Admin::InvoicesController < Admin::AdminController

  include SendZip

  def index
    authorize Invoice, :index?
    @q = Task.not_paid.where(status: 'done_confirmed').order('fact_end DESC').search(params[:q])
    @tasks_no_pagerer = @q.result
    @tasks = @tasks_no_pagerer.page(params[:page]).per(params[:per_page])
  end

  def archive
    authorize Invoice, :index?
    @q = Task.paid.where(status: 'done_confirmed').order('fact_end DESC').search(params[:q])
    @tasks_no_pagerer = @q.result
    @tasks = @tasks_no_pagerer.page(params[:page]).per(params[:per_page])
  end

  def download
    authorize Invoice, :index?
    r = Rails.application.config.root
    @q = Task.distinct.where(status: 'done_confirmed').order('fact_end DESC').search(params[:q])
    @tasks_no_pagerer = @q.result
    @files = @tasks_no_pagerer.map{|e| r.to_s+'/public'+e.invoice_pdf_path}
    send_zip @files, filename: 'invoices.zip'
  end

  def pay
    authorize Invoice, :edit?
    @task = Task.find params[:id]
    @task.invoice.pay!
  end

  def unpay
    authorize Invoice, :edit?
    @task = Task.find params[:id]
    @task.invoice.unpay!
  end

  def history
    authorize Invoice, :index?
    @task = Task.eager_load(:invoice).find params[:id]
  end

  def invoice_report
    authorize Invoice, :index?
    @task = Task.find params[:id]
    render layout: false
  end

end
