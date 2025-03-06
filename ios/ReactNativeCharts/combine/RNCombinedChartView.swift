//  Created by xudong wu on 24/02/2017.
//  Copyright wuxudong
//

import DGCharts
import SwiftyJSON

class RNCombinedChartView: RNBarLineChartViewBase {

    let _chart: CombinedChartView;
    let _dataExtract : CombinedDataExtract;

    override var chart: CombinedChartView {
        return _chart
    }

    override var dataExtract: DataExtract {
        return _dataExtract
    }

    override init(frame: CoreGraphics.CGRect) {

        self._chart = CombinedChartView(frame: frame)
        self._dataExtract = CombinedDataExtract()

        super.init(frame: frame)

        self._chart.delegate = self
        self.addSubview(_chart)
    }

    override func layoutSubviews() {
       super.layoutSubviews()
       _chart.frame = self.bounds // Adjust the chart's frame to fill the entire component's bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setDrawOrder(_ config: NSArray) {
        var array : [Int] = []
        for object in RCTConvert.nsStringArray(config) {
            array.append(BridgeUtils.parseDrawOrder(object).rawValue)
        }
        _chart.drawOrder = array
    }

    func setDrawValueAboveBar(_ enabled: Bool) {
        _chart.drawValueAboveBarEnabled = enabled
    }

    func setDrawBarShadow(_ enabled: Bool) {
        _chart.drawBarShadowEnabled = enabled
    }

    func setHighlightFullBarEnabled(_ enabled: Bool) {
        _chart.highlightFullBarEnabled = enabled
    }

}
