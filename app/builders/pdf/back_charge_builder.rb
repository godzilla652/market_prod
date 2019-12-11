class Pdf::BackChargeBuilder < SimpleDelegator
  def initialize(task)
    super
  end

  def build!(line)
    kit = PDFKit.new(<<-HTML)
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>ASTRA</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<style type="text/css">
html {
    height: 0;
}
body {
    font-family: Arial,sans-serif;
    font-size: 12px;
    line-height: 1.5;
    color: #333333;
}
.container{
    width: 100%;
    margin: 0 auto;
}
header img{
    max-width: 150px;
    height: auto;
}
table{
    width: 100%;
    margin-top: 40px;
    border-collapse: collapse;
}
th{
    text-align: left;
    padding: 8px 16px;
}
td{
    vertical-align: top;
    padding: 8px 16px;
}
.total-td{
    border-left: 1px solid #fff;
    border-bottom: 1px solid #fff;
    text-align: right;
    font-weight: bold;
}
.text-strong{
    font-weight: bold;
}
.text-underline{
    text-decoration: underline;
}
.subtitle{
    font-size: 12px;
    font-weight: bold;
    text-align: right;
    padding: 30px 0;
}
.invoice {
    width: 50%;
    float: right;
    position: relative;
    bottom: 0px;
    top: 100px;
    left: 16px;
}
</style>

</head>
<body>
    <div class="container">
        <header style="height: 80px;">

      <span style="width:50%;height: 50px;font-size: 18px;" class="invoice"><b>BACK CHARGE #{line.id}</b></span>
        </header>
        <table class="top-table">
            <tbody>
                <tr>
                    <td width="50%">
                       
                      <p>ASTRA Construction Management<br>
                        888 – 3rd Street SW, 10th Floor<br>
                        Bankers Hall, West Tower<br>
                        Calgary, Alberta, T2P 5C5</p>
                    </td>
                 
                    <td width="50%" class="text-strong">
                        <p>  </p>
                        <p>PO: 25700</p>
  <p>Project №: #{project_task.number}</p>
  <p>Project name: #{project_task.name}</p>
                        <p>Category: #{task_type}</p>
                    </td>
                </tr>
            </tbody>
        </table>

        <table class="middle-table">
            <tbody>
                <tr>
                      <td width="50%">
                        <p class="text-strong">To</p>
                        <p>#{concierge.full_name if concierge}<br>
            #{(concierge.contract.views_mailing_address if concierge.contract) if concierge}<br>
                        #{(concierge.contract.telephone if concierge.contract) if concierge}<br>
                    </td>
                    <td width="50%">

                    </td>
                </tr>
            </tbody>
        </table>

        <table class="bottom-table" border="1">
            <tbody>
                <tr class="text-strong">
                    <td colspan="2" width="50%">Ordered by:  #{concierge.full_name if concierge}</td>
                    <td colspan="4" width="50%">Requested by: #{owner.full_name if owner}</td>
                </tr>
                <tr>
                    <td colspan="2" width="50%">
                        <p class="text-strong">Bill To:</p>
                        <p>ASTRA Construction Management<br>
                        888 – 3rd Street SW, 10th Floor<br>
                        Bankers Hall, West Tower<br>
                        Calgary, Alberta, T2P 5C5</p>
                    </td>
                    <td colspan="4" width="50%">
                        <p class="text-strong">Ship To:</p>
                        <p>#{place.address if place}</p>
                    </td>
                </tr>
                <tr>
                    <th width="10%">Part No.</th>
                    <th width="40%">Description/Details</th>
                    <th width="12.5%">Qty</th>
                    <th width="12.5%">Unit of Measure</th>
                    <th width="12.5%">Unit Price</th>
                    <th width="12.5%">Total Cost</th>
                </tr>
                <tr>
                    <td width="10%"></td>
                    <td width="40%">#{line.title}</td>
                    <td width="12.5%">1.0000</td>
                    <td width="12.5%"></td>
                    <td width="12.5%">#{line.budget}</td>
                    <td width="12.5%">#{line.budget}</td>
                </tr>
                <tr>
                    <td colspan="5" width="88.5%" class="total-td">Subtotal</td>
                    <td width="12.5%">#{line.budget}</td>
                </tr>
                <tr>
                    <td colspan="5" width="88.5%" class="total-td">GST or HST Tax:</td>
                    <td width="12.5%">#{sprintf('%.2f', (tax = line.budget * line.task.gst_calc / 100))}</td>
                </tr>
                <tr>
                    <td colspan="5" width="88.5%" class="total-td">Sales Tax<sup>¹</sup>:</td>
                    <td width="12.5%">0.00</td>
                </tr>
                <tr>
                    <td colspan="5" width="88.5%" class="total-td">Total:</td>
                    <td width="12.5%">#{sprintf('%.2f', (line.budget + tax))}</td>
                </tr>
            </tbody>
        </table>


    <table class="middle-table">
        <tbody>
          <tr>
            <td width="50%">
                <p >GST#: #{(concierge.contract.gst if concierge.contract) if concierge}</p>
            </td>
            <td width="50%">
                <p ><sup>¹</sup>Either PST or QST dependent on the province</p>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
</body>

</html>
    HTML
    kit.to_file("#{PDF_PUBLIC_PATH}#{line.invoice_pdf_path}")
  end
end
