package cn.cnic.controller.api.flow;

import cn.cnic.component.flow.service.IFlowStopsPublishingService;
import cn.cnic.component.system.service.ILogHelperService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import cn.cnic.base.utils.ReturnMapUtils;
import cn.cnic.base.utils.SessionUserUtil;
import cn.cnic.component.flow.service.IPropertyService;
import cn.cnic.component.flow.service.IStopsService;
import cn.cnic.component.flow.vo.StopsCustomizedPropertyVo;
import cn.cnic.component.stopsComponent.service.IStopGroupService;
import io.swagger.annotations.Api;

import java.util.List;

@Api(value = "stops api", tags = "stops api")
@RestController
@RequestMapping("/stops")
public class StopsCtrl {

    private final IStopGroupService stopGroupServiceImpl;
    private final IPropertyService propertyServiceImpl;
    private final IStopsService stopsServiceImpl;
    private final IFlowStopsPublishingService flowStopsPublishingServiceImpl;
    private final ILogHelperService logHelperServiceImpl;

    @Autowired
    public StopsCtrl(IStopGroupService stopGroupServiceImpl,
                     IPropertyService propertyServiceImpl,
                     IStopsService stopsServiceImpl,
                     IFlowStopsPublishingService flowStopsPublishingServiceImpl,
                     ILogHelperService logHelperServiceImpl) {
        this.stopGroupServiceImpl = stopGroupServiceImpl;
        this.propertyServiceImpl = propertyServiceImpl;
        this.stopsServiceImpl = stopsServiceImpl;
        this.flowStopsPublishingServiceImpl = flowStopsPublishingServiceImpl;
        this.logHelperServiceImpl = logHelperServiceImpl;
    }

    /**
     * 'stops'and'groups' on the left of'reload'
     *
     * @param load
     * @return
     */
    @RequestMapping(value = "/reloadStops", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="reloadStops", notes="reload Stops")
    public String reloadStops(String load) {
        String username = SessionUserUtil.getCurrentUsername();
        stopGroupServiceImpl.updateGroupAndStopsListByServer(username);
        return ReturnMapUtils.setSucceededCustomParamRtnJsonStr("load", load);
    }

    @RequestMapping(value = "/queryIdInfo", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="queryIdInfo", notes="query id info")
    public String getStopGroup(String fid, String stopPageId) {
        return propertyServiceImpl.queryAll(fid, stopPageId);
    }

    @RequestMapping(value = "/deleteLastReloadData", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="deleteLastReloadData", notes="delete last reload data")
    public String deleteLastReloadData(String stopId) {
        return propertyServiceImpl.deleteLastReloadDataByStopsId(stopId);
    }

    /**
     * Multiple saves to modify
     *
     * @param content
     * @param id
     * @return
     */
    @RequestMapping(value = "/updateStops", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="updateStops", notes="update Stops")
    public String updateStops(String[] content, String id) {
        String username = SessionUserUtil.getCurrentUsername();
        logHelperServiceImpl.logAuthSucceed("updateStops " + id,username);
        return propertyServiceImpl.updatePropertyList(username, content);
    }

    @RequestMapping(value = "/updateStopsOne", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="updateStopsOne", notes="update Stops one")
    public String updateStops(String content, String id) {
        String username = SessionUserUtil.getCurrentUsername();
        logHelperServiceImpl.logAuthSucceed("updateStopOne " + id, username);
        return propertyServiceImpl.updateProperty(username, content, id);
    }

    /**
     * Get the usage of the current connection port
     *
     * @param flowId
     * @param sourceId
     * @param targetId
     * @param pathLineId
     * @return
     */
    @RequestMapping(value = "/getStopsPort", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="getStopsPort", notes="get Stops port")
    public String getStopsPort(String flowId, String sourceId, String targetId, String pathLineId) {
        return stopsServiceImpl.getStopsPort(flowId, sourceId, targetId, pathLineId);
    }

    @RequestMapping(value = "/updateStopsById", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="updateStopsById", notes="update Stops by id")
    public String updateStopsById(String stopId, String isCheckpoint) throws Exception {
        String username = SessionUserUtil.getCurrentUsername();
        logHelperServiceImpl.logAuthSucceed("updateStopsById" + stopId, username);
        return stopsServiceImpl.updateStopsCheckpoint(username, stopId, isCheckpoint);
    }

    @RequestMapping(value = "/updateStopsNameById", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="updateStopsNameById", notes="update Stops name by id")
    public String updateStopsNameById(String stopId, String flowId, String name, String pageId) throws Exception {
        String username = SessionUserUtil.getCurrentUsername();
        boolean isAdmin = SessionUserUtil.isAdmin();
        logHelperServiceImpl.logAuthSucceed("updateStopsNameById" + name, username);
        return stopsServiceImpl.updateStopName(username, isAdmin, stopId, flowId, name, pageId);
    }

    @RequestMapping(value = "/addStopCustomizedProperty", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="addStopCustomizedProperty", notes="add StopsCustomizedProperty")
    public String addStopCustomizedProperty(StopsCustomizedPropertyVo stopsCustomizedPropertyVo) throws Exception {
        String username = SessionUserUtil.getCurrentUsername();
        return stopsServiceImpl.addStopCustomizedProperty(username, stopsCustomizedPropertyVo);
    }

    @RequestMapping(value = "/updateStopsCustomizedProperty", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="updateStopsCustomizedProperty", notes="update StopsCustomizedProperty")
    public String updateStopsCustomizedProperty(StopsCustomizedPropertyVo stopsCustomizedPropertyVo) {
        String username = SessionUserUtil.getCurrentUsername();
        return stopsServiceImpl.updateStopsCustomizedProperty(username, stopsCustomizedPropertyVo);
    }

    @RequestMapping(value = "/deleteStopsCustomizedProperty", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="deleteStopsCustomizedProperty", notes="delete StopsCustomizedProperty")
    public String deleteStopsCustomizedProperty(String customPropertyId) {
        String username = SessionUserUtil.getCurrentUsername();
        return stopsServiceImpl.deleteStopsCustomizedProperty(username, customPropertyId);
    }

    @RequestMapping(value = "/deleteRouterStopsCustomizedProperty", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="deleteRouterStopsCustomizedProperty", notes="delete RouterStopsCustomizedProperty")
    public String deleteRouterStopsCustomizedProperty(String customPropertyId) {
        String username = SessionUserUtil.getCurrentUsername();
        return stopsServiceImpl.deleteRouterStopsCustomizedProperty(username, customPropertyId);
    }

    @RequestMapping(value = "/getRouterStopsCustomizedProperty", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="getRouterStopsCustomizedProperty", notes="get RouterStopsCustomizedProperty")
    public String getRouterStopsCustomizedProperty(String customPropertyId) {
        return stopsServiceImpl.getRouterStopsCustomizedProperty(customPropertyId);
    }

    @RequestMapping(value = "/getStopsNameByFlowId", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="getStopsNameByFlowId", notes="Get stop name by flow id")
    public String getStopsNameByFlowId(String flowId) {
        return stopsServiceImpl.getStopsNameByFlowId(flowId);
    }

    @RequestMapping(value = "/updateStopDisabled", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="updateStopDisabled", notes="update Stops disabled")
    public String updateStopDisabled(String id, Boolean disabled) {
        String username = SessionUserUtil.getCurrentUsername();
        Boolean isAdmin = SessionUserUtil.isAdmin();
        return propertyServiceImpl.updateStopDisabled(username, isAdmin, id, disabled);
    }

    @RequestMapping(value = "/publishingStops", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="publishingStops", notes="Publishing Stops")
    public String publishingStops(String name, String stopsIds) {
        String username = SessionUserUtil.getCurrentUsername();
        return flowStopsPublishingServiceImpl.addFlowStopsPublishing(username, name, stopsIds);
    }

    @RequestMapping(value = "/updatePublishing", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="updatePublishing", notes="Update Publishing")
    public String updatePublishing(String publishingId, String name, String stopsIds) {
        Boolean isAdmin = SessionUserUtil.isAdmin();
        String username = SessionUserUtil.getCurrentUsername();
        return flowStopsPublishingServiceImpl.updateFlowStopsPublishing(isAdmin, username, publishingId, name, stopsIds);
    }

    @RequestMapping(value = "/getPublishingById", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="getPublishingById", notes="Get Publishing by PublishingId")
    public String getPublishingById(String publishingId) {
        return flowStopsPublishingServiceImpl.getFlowStopsPublishingVo(publishingId);
    }

    @RequestMapping(value = "/getPublishingListByFlowId", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="getPublishingListByFlowId", notes="Get Publishing list")
    public String getPublishingListByFlowId(String flowId) {
        String username = SessionUserUtil.getCurrentUsername();
        return flowStopsPublishingServiceImpl.getFlowStopsPublishingListByFlowId(username, flowId);
    }

    @RequestMapping(value = "/getPublishingListPager", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="getPublishingListPager", notes="Get Publishing list")
    public String getPublishingList(Integer page, Integer limit, String param) {
        String username = SessionUserUtil.getCurrentUsername();
        Boolean isAdmin = SessionUserUtil.isAdmin();
        return flowStopsPublishingServiceImpl.getFlowStopsPublishingListPager(username, isAdmin, page, limit, param);
    }

    @RequestMapping(value = "/deleteFlowStopsPublishing", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="deleteFlowStopsPublishing", notes="Delete Publishing")
    public String deleteFlowStopsPublishing(String publishingId) {
        String username = SessionUserUtil.getCurrentUsername();
        return flowStopsPublishingServiceImpl.deleteFlowStopsPublishing(username, publishingId);
    }

}
